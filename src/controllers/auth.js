const { Router } = require("express");
const jwt = require("jsonwebtoken");
const { registerMiddleware } = require("../middlewares/registerMiddleware");
const { loginMiddleware } = require("../middlewares/loginMiddleware");
const { models } = require("../models");
const bcrypt = require("bcrypt");
const { Op } = require("sequelize");
const { authMiddleware } = require("../middlewares/authMiddleware");
const herokuAwake = require("heroku-awake");
const url = "https://sunflower-itss.herokuapp.com";

const router = Router();

router.post("/register", registerMiddleware, async (req, res) => {
  const { name, password, email } = req.body;
  const { User } = models;
  const foundUser = await User.findOne({
    where: {
      email: {
        [Op.eq]: email
      }
    },
  });
  if (foundUser) {
    return res.status(400).send("Người dùng này đã tồn tại");
  }
  const newUser = await User.create({
    name,
    email,
    password: bcrypt.hashSync(password, 10),
  });
  return res.status(201).send({
    id: newUser.id,
    message: "Đăng ký thành công"
  });
});

router.post("/login", loginMiddleware, async (req, res) => {
  const { email, password } = req.body;
  const { User } = models;
  const found = await User.findOne({
    where: {
      email: {
        [Op.eq]: email
      }
    },
  });
  if (!found) {
    return res.status(401).send({ "message": "Email không chính xác" });
  }
  const isPasswordCorrect = bcrypt.compareSync(password, found.password);
  if (!isPasswordCorrect) {
    return res.status(401).send({ "message": "Mật khẩu không chính xác" });
  }
  const token = jwt.sign(
    { id: found.id, name: found.name, email: found.email },
    process.env.JWT_SECRET
  );
  return res.status(200).send({ token: token, id: found.id });
});

router.post("/profile", authMiddleware, async (req, res) => {
  const { id } = req.body;
  const { User } = models;
  const found = await User.findOne({
    where: {
      id: {
        [Op.eq]: id
      }
    },
  });
  if (!found) {
    return res.status(404).send({ "message": "Người đung không tồn tại" });
  }

  return res.status(200).send({ id: found.id, name: found.name, email: found.email })
})

router.put("/profile", authMiddleware, async (req, res) => {
  const { id, name, email } = req.body;
  const { User } = models;
  const user = await User.findOne({
    where: {
      id: {
        [Op.eq]: id
      }
    },
  });
  if (!user) {
    return res.status(404).send({ "message": "Người đung không tồn tại" });
  }

  user.name = name
  user.email = email
  await user.save()

  return res.status(200).send({ "message": "Thông tin người dùng đã được cập nhật" })
})

router.post("/update-password", authMiddleware, async (req, res) => {
  const { id, current_password, new_password } = req.body
  const { User } = models;
  const user = await User.findOne({
    where: {
      id: {
        [Op.eq]: id
      }
    },
  });
  if (!user) {
    return res.status(404).send({ "message": "Người đung không tồn tại" });
  }

  if (!bcrypt.compareSync(current_password, user.password)) {
    return res.status(404).send({ "message": "Mật khẩu không chính xác" })
  }

  user.password = bcrypt.hashSync(new_password, 10)
  await user.save()

  return res.status(200).send({ "message": "Mật khẩu đã được cập nhật" })
})

module.exports = router;

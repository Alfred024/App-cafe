enum Role { admin, client }

class User {
  String? fullName;
  String email;
  String? password;
  String token;
  DateTime? createdAt;
  Role? role;

  User({
    this.fullName,
    this.role = Role.client,
    this.password,
    required this.email,
    required this.token,
  }) {
    createdAt ??= DateTime.now();
  }
}

// model UserInfo {
//   userInfoId String   @id @default(uuid())
//   fullName   String
//   //Here i deleted lastName, phone and address
//   createdAt  DateTime @default(now())
//   updatedAt  DateTime @updatedAt
//   //Relations
//   user       User     @relation(fields: [userId], references: [userId])
//   userId     String   @unique
// }
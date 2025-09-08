export function getFullNameAndCredentials(
  user: Pick<User, "firstName" | "lastName" | "credentials">
): string {
  const name = [user.firstName, user.lastName].filter(Boolean).join(" ");
  return user.credentials ? `${name}, ${user.credentials}` : name;
}

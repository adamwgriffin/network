export function getRouteParam(param: string | string[] | undefined): string {
  return (Array.isArray(param) ? param[0] : param) ?? "";
}

export function getConnectionsText(count: number) {
  const text = count === 1 ? "Connection" : "Connections";
  return `${count} ${text}`;
}

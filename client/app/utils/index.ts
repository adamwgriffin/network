export function getRouteParam(param: string | string[] | undefined): string {
  return (Array.isArray(param) ? param[0] : param) ?? "";
}

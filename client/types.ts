export interface TokenPayload {
  iss: "ApiAuth";
  sub: string;
  domain: string;
  admin: boolean;
  iat: number;
  exp: number;
}

export interface LinksQuery {
  all?: boolean;
  limit: string;
  skip?: string;
  search?: string;
}

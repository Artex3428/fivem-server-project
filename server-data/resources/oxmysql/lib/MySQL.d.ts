type Query = string | number;
type Params = Record<string, unknown> | unknown[] | Function;
type Callback<T> = (result: T | null) => void;
type Transaction = string[] | [string, Params][] | {
    query: string;
    values: Params;
}[] | {
    query: string;
    parameters: Params;
}[];
interface Result {
    [column: string | number]: any;
    affectedRows?: number;
    fieldCount?: number;
    info?: string;
    insertId?: number;
    serverStatus?: number;
    warningStatus?: number;
    changedRows?: number;
}
interface Row {
    [column: string | number]: unknown;
}
interface OxMySQL {
    store: (query: string) => number;
    ready: (callback: () => void) => void;
    query: <T = Result | null>(query: Query, params?: Params | Callback<T>, cb?: Callback<T>) => Promise<T>;
    single: <T = Row | null>(query: Query, params?: Params | Callback<Exclude<T, []>>, cb?: Callback<Exclude<T, []>>) => Promise<Exclude<T, []>>;
    scalar: <T = unknown | null>(query: Query, params?: Params | Callback<Exclude<T, []>>, cb?: Callback<Exclude<T, []>>) => Promise<Exclude<T, []>>;
    update: <T = number | null>(query: Query, params?: Params | Callback<T>, cb?: Callback<T>) => Promise<T>;
    insert: <T = number | null>(query: Query, params?: Params | Callback<T>, cb?: Callback<T>) => Promise<T>;
    prepare: <T = any>(query: Query, params?: Params | Callback<T>, cb?: Callback<T>) => Promise<T>;
    rawExecute: <T = Result | null>(query: Query, params?: Params | Callback<T>, cb?: Callback<T>) => Promise<T>;
    transaction: (query: Transaction, params?: Params | Callback<boolean>, cb?: Callback<boolean>) => Promise<boolean>;
    isReady: () => boolean;
    awaitConnection: () => Promise<true>;
    startTransaction: (cb: (query: <T = Result | null>(statement: string, params?: Params) => Promise<T>) => Promise<boolean | void>) => Promise<boolean>;
}
export declare const oxmysql: OxMySQL;
export {};

const QueryStore = [];
function assert(condition, message) {
    if (!condition)
        throw new TypeError(message);
}
const safeArgs = (query, params, cb, transaction) => {
    if (typeof query === 'number') {
        query = QueryStore[query];
        assert(typeof query === 'string', 'First argument received invalid query store reference');
    }
    if (transaction) {
        assert(typeof query === 'object', `First argument expected object, recieved ${typeof query}`);
    }
    else {
        assert(typeof query === 'string', `First argument expected string, received ${typeof query}`);
    }
    if (params) {
        const paramType = typeof params;
        assert(paramType === 'object' || paramType === 'function', `Second argument expected object or function, received ${paramType}`);
        if (!cb && paramType === 'function') {
            cb = params;
            params = undefined;
        }
    }
    if (cb !== undefined)
        assert(typeof cb === 'function', `Third argument expected function, received ${typeof cb}`);
    return [query, params, cb];
};
const exp = global.exports.oxmysql;
const currentResourceName = GetCurrentResourceName();
function execute(method, query, params) {
    return new Promise((resolve, reject) => {
        exp[method](query, params, (result, error) => {
            if (error)
                return reject(error);
            resolve(result);
        }, currentResourceName, true);
    });
}
export const oxmysql = {
    store(query) {
        assert(typeof query === 'string', `Query expects a string, received ${typeof query}`);
        // push() returns the new length; callers index QueryStore by position
        return QueryStore.push(query) - 1;
    },
    ready(callback) {
        setImmediate(async () => {
            while (GetResourceState('oxmysql') !== 'started')
                await new Promise((resolve) => setTimeout(resolve, 50, null));
            callback();
        });
    },
    async query(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('query', query, params);
        return cb ? cb(result) : result;
    },
    async single(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('single', query, params);
        return cb ? cb(result) : result;
    },
    async scalar(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('scalar', query, params);
        return cb ? cb(result) : result;
    },
    async update(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('update', query, params);
        return cb ? cb(result) : result;
    },
    async insert(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('insert', query, params);
        return cb ? cb(result) : result;
    },
    async prepare(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('prepare', query, params);
        return cb ? cb(result) : result;
    },
    async rawExecute(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb);
        const result = await execute('rawExecute', query, params);
        return cb ? cb(result) : result;
    },
    async transaction(query, params, cb) {
        [query, params, cb] = safeArgs(query, params, cb, true);
        const result = await execute('transaction', query, params);
        return cb ? cb(result) : result;
    },
    isReady() {
        return exp.isReady();
    },
    async awaitConnection() {
        return await exp.awaitConnection();
    },
    async startTransaction(cb) {
        return exp.startTransaction(cb, currentResourceName);
    },
};
//# sourceMappingURL=MySQL.js.map
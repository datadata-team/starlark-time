assert.eq(type(time.altzone), "int")
assert.eq(type(time.timezone), "int")
assert.eq(type(time.tzname), "tuple")

assert.eq(type(time), "module")
assert.eq(type(time.time()), "float")

assert.eq(type(time.gmtime()), "time.Time")
assert.eq(type(time.gmtime(time.time())), "time.Time")

assert.eq(type(time.localtime()), "time.Time")
assert.eq(type(time.localtime(time.time())), "time.Time")

assert.eq(type(time.ctime()), "string")
assert.eq(type(time.ctime(time.time())), "string")

assert.eq(type(time.asctime()), "string")
assert.eq(type(time.asctime(time.localtime())), "string")

assert.eq(type(time.mktime(time.localtime())), "float")

# 和 python 一致
assert.eq(int(time.mktime(time.gmtime())) - int(time.mktime(time.localtime())), -28800)

# 至少指定一个参数
assert.fails(lambda: time.strftime(), "strftime: got 0 arguments, want at least 1")

# 格式化
assert.eq(type(time.strftime("%Y")), "string")
assert.true(time.strftime("%c", time.gmtime()) != time.strftime("%c", time.localtime()))

# 解析字符串
t1 = time.strptime("Thu Jun 20 14:51:18 CST 2024", "%a %b %d %H:%M:%S %Z %Y")
assert.eq(time.strftime("%Y-%m-%d", t1), "2024-06-20")
assert.eq(time.strftime("%H:%M:%S", t1), "14:51:18")
assert.eq(time.strftime("%Y-%m-%d %H:%M:%S", t1), "2024-06-20 14:51:18")


# 测试 time.Time 属性
t2 = time.strptime("Thu Jun 20 14:51:18 CST 2024", "%a %b %d %H:%M:%S %Z %Y")
assert.eq(t1.tm_year, 2024)
assert.eq(t1.tm_mon, 6)
assert.eq(t1.tm_mday, 20)
assert.eq(t1.tm_hour, 14)
assert.eq(t1.tm_min, 51)
assert.eq(t1.tm_sec, 18)
assert.eq(t1.tm_wday, 4)
assert.eq(t1.tm_yday, 172)
assert.eq(t1.tm_isdst, False)

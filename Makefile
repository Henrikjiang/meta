# 定义编译器
CC=C:\\mingw64\\bin\\gcc.exe

# 定义编译选项，-I指定头文件目录
CFLAGS=-Iinc

# 定义目标可执行文件名
TARGET=Hello.exe

# 定义源文件目录和源文件
SRCDIR=src
SOURCES=$(wildcard $(SRCDIR)/*.c)

# 定义对象文件
OBJECTS=$(SOURCES:.c=.o)

# 默认目标
all: $(TARGET)

# 链接对象文件生成可执行文件
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@

# 从.c文件生成.o文件的规则
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清除生成的文件
clean:
	del src\*.o $(TARGET)


# 防止文件名冲突
.PHONY: all clean

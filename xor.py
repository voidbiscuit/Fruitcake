import sys


def xor(key, message):
    result = ""
    for i in range(0, max(len(key), len(message))):
        x = key[i % len(key)]
        y = message[i % len(message)]
        z = chr(ord(x) ^ ord(y))
        result += z
    return str(result)


if __name__ == '__main__':
    if(len(sys.argv) < 3):
        print("Arguments: key message")
    else:
        key = sys.argv[1]
        msg = sys.argv[2]
        print(xor(key, msg))

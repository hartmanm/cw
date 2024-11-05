# cw

# Dynamically Add APIs and New API Commands

This guide shows how to dynamically add APIs and new API commands and use them with the `invoke.sh` script.

## Basic Concept

You can invoke API commands using the `invoke.sh` script with different arguments that represent the API endpoints or commands. The format for invoking the command is:

```bash
bash invoke.sh apis/cmds <command>
```

where cmds is a file and each line is of the form:

```bash
reference_name        api_cmd_token        2>/dev/null;         any unescaped bash/sh code
```

In the example cmds file: 
```bash 
ip
``` 
is the name of the command on the third line. So
```bash
bash invoke.sh apis/cmds ip
```
is equalivent to:
```bash
bash invoke.sh apis/cmds 3
```
And
```bash
bash invoke.sh apis/cmds hw 
```
is equalivent to:
```bash
bash invoke.sh apis/cmds 7
```


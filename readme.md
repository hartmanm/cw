# cw

## dynamically add apis and new api commands, run lists of api commands from sets of api files

This guide shows how to dynamically add APIs and new API commands and use them with the `invoke.sh` script.

## Basic Concept

You can invoke API commands using the `invoke.sh` script with different arguments that represent the API endpoints or commands. The format for invoking the command is:

```bash
bash invoke.sh apis/cmds <command>
```

where cmds is a file and each line is of the form:

```bash
api_cmd_token      any unescaped bash/sh code
```

to run all the cmds in all of the api files you can run the ra.sh wrapper:
```bash 
bash ra.sh 
``` 

to run all the cmds in subset of the api files you can run the ra.sh wrapper with each api file as a parameter:
```bash 
bash ra.sh cmds
```
or 
```bash 
bash ra.sh cmds cmds2
```

In the example cmds file: 
```bash 
ip
``` 
is the name of the command on the seventh line. So
```bash
bash invoke.sh apis/cmds ip
```
is equalivent to:
```bash
bash invoke.sh apis/cmds 7
```
And
```bash
bash invoke.sh apis/cmds hw 
```
is equalivent to:
```bash
bash invoke.sh apis/cmds 11
```


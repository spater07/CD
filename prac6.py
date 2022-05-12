from tabulate import tabulate


def main():
    path = 'input.txt'
    with open(path, 'r') as file:
        lines = file.readlines()

    for i in range(len(lines)):
        lines[i] = lines[i][:-1]

    for_statement = ""
    for i in range(len(lines)):
        if 'if' in lines[i]:
            if_statement = lines[i]
            if_statement_index = i

        if 'else' in lines[i]:
            else_statement = lines[i]
            else_statement_index = i

        if 'for' in lines[i]:
            for_statement = lines[i].split(";")[0]
            for_statement_index = i

    statements = for_statement.replace('for', 'if').split("(")

    for_statement = statements[0]+" ("+statements[1]+")"

    if_statement_list = []
    else_statement_list = []
    else_final = []
    if_final = []
    for_final = []

    for j in lines[if_statement_index+2:]:
        if '}' in j:
            break
        if_statement_list.append(j)

    for i in if_statement_list:
        c, p = i.split('=')
        if_final.append('t='+p)
        if_final.append(c+'=t')

    for j in lines[else_statement_index+2:-1]:
        if '}' in j:
            break
        else_statement_list.append(j)

    for i in else_statement_list:
        c, p = i.split('=')
        else_final.append('t='+p)
        else_final.append(c+'=t')

    c, p = lines[-2].split('=')
    for_final.append('t='+p)
    for_final.append(c+'=t')

    li_final = []
    exit_goto = len(else_final) + len(if_final) + len(for_final) + 3 + 3 + 2
    li_final.append(for_statement + ' goto '+str(3))
    li_final.append('goto '+str(exit_goto))
    li_final.append(if_statement+'goto '+str(len(else_final)+2))
    for i in else_final:
        li_final.append(i)
    goto_if = len(else_final) + (len(if_final)+1) + 4
    li_final.append('goto '+str(goto_if))
    for i in if_final:
        li_final.append(i)
    for i in for_final:
        li_final.append(i)
    li_final.append("t=i+1")
    li_final.append("i=t")
    li_final.append('goto 1')
    li_final.append('exit')

    table = []
    lis = []
    lis.append(0)
    lis.append("i=0")
    table.append(lis)
    for i in range(len(li_final)):
        li = []
        li.append(i+1)

        li.append(li_final[i])
        table.append(li)

    head = ['Label', 'Code']
    print(tabulate(table, headers=head, tablefmt="grid"))


if __name__ == '__main__':
    main()

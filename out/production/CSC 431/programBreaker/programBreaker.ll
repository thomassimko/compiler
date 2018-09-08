target triple="i686"

@GLOBAL = common global i32 0, align 8
@count = common global i32 0, align 8

define i32 @fun2(i32 %_P_x, i32 %_P_y)
{

L1:
	%_retval_ = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%r0 = load i32, i32* %x
	%r1 = icmp eq i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	%r4 = load i32, i32* %y
	store i32 %r4, i32* %_retval_
	br label %L2
L4:
	%r6 = load i32, i32* %x
	%r7 = sub i32 %r6, 1
	%r8 = load i32, i32* %y
	%r9 = call i32 @fun2(i32 %r7, i32 %r8 )
	store i32 %r9, i32* %_retval_
	br label %L2
L2:
	%r5 = load i32, i32* %_retval_
	ret i32 %r5
}

define i32 @fun1(i32 %_P_x, i32 %_P_y, i32 %_P_z)
{

L7:
	%_retval_ = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%z = alloca i32
	store i32 %_P_z, i32* %z
	%retVal = alloca i32
	%r11 = add i32 5, 6
	%r12 = load i32, i32* %x
	%r13 = mul i32 %r12, 2
	%r14 = sub i32 %r11, %r13
	%r15 = load i32, i32* %y
	%r16 = sdiv i32 4, %r15
	%r17 = add i32 %r14, %r16
	%r18 = load i32, i32* %z
	%r19 = add i32 %r17, %r18
	store i32 %r19, i32* %retVal
	%r20 = load i32, i32* %retVal
	%r21 = load i32, i32* %y
	%r22 = icmp sgt i32 %r20, %r21
	%r23 = zext i1 %r22 to i32
	%r24 = trunc i32 %r23 to i1
	br i1 %r24, label %L9, label %L10

L9:
	%r25 = load i32, i32* %retVal
	%r26 = load i32, i32* %x
	%r27 = call i32 @fun2(i32 %r25, i32 %r26 )
	store i32 %r27, i32* %_retval_
	br label %L8
L10:
	%r29 = icmp slt i32 5, 6
	%r30 = zext i1 %r29 to i32
	%r31 = load i32, i32* %retVal
	%r32 = load i32, i32* %y
	%r33 = icmp sle i32 %r31, %r32
	%r34 = zext i1 %r33 to i32
	%r35 = and i32 %r30, %r34
	%r36 = trunc i32 %r35 to i1
	br i1 %r36, label %L12, label %L13

L11:
	%r41 = load i32, i32* %retVal
	store i32 %r41, i32* %_retval_
	br label %L8
L12:
	%r37 = load i32, i32* %retVal
	%r38 = load i32, i32* %y
	%r39 = call i32 @fun2(i32 %r37, i32 %r38 )
	store i32 %r39, i32* %_retval_
	br label %L8
L13:
	br label %L14
L14:
	br label %L11
L8:
	%r28 = load i32, i32* %_retval_
	ret i32 %r28
}

define i32 @main()
{

L16:
	%_retval_ = alloca i32
	%i = alloca i32
	store i32 0, i32* %i
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r43 = load i32, i32* @.read_scratch
	store i32 %r43, i32* %i
	%r44 = load i32, i32* %i
	%r45 = icmp slt i32 %r44, 10000
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L18, label %L19

L18:
	%r48 = load i32, i32* %i
	%r49 = call i32 @fun1(i32 3, i32 %r48, i32 5 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r49)
	%r50 = load i32, i32* %i
	%r51 = add i32 %r50, 1
	store i32 %r51, i32* %i
	%r52 = load i32, i32* %i
	%r53 = icmp slt i32 %r52, 10000
	%r54 = zext i1 %r53 to i32
	%r55 = trunc i32 %r54 to i1
	br i1 %r55, label %L18, label %L19

L19:
	store i32 0, i32* %_retval_
	br label %L17
L17:
	%r56 = load i32, i32* %_retval_
	ret i32 %r56
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
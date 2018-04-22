target triple="i686"

%struct.Power = type {i32, i32}

define i32 @calcPower(i32 %_P_base, i32 %_P_exp)
{

L2:
	%_retval_ = alloca i32
	%base = alloca i32
	store i32 %_P_base, i32* %base
	%exp = alloca i32
	store i32 %_P_exp, i32* %exp
	%result = alloca i32
	store i32 1, i32* %result
	%r5 = load i32, i32* %exp
	%r6 = icmp sgt i32 %r5, 0
	%r7 = zext i1 %r6 to i32
	%r8 = trunc i32 %r7 to i1
	br i1 %r8, label %L4, label %L5

L4:
	%r0 = load i32, i32* %result
	%r1 = load i32, i32* %base
	%r2 = mul i32 %r0, %r1
	store i32 %r2, i32* %result
	%r3 = load i32, i32* %exp
	%r4 = sub i32 %r3, 1
	store i32 %r4, i32* %exp
	%r9 = load i32, i32* %exp
	%r10 = icmp sgt i32 %r9, 0
	%r11 = zext i1 %r10 to i32
	%r12 = trunc i32 %r11 to i1
	br i1 %r12, label %L4, label %L5

L5:
	%r13 = load i32, i32* %result
	store i32 %r13, i32* %_retval_
	br label %L3
L3:
	%r14 = load i32, i32* %_retval_
	ret i32 %r14
}

define i32 @main()
{

L7:
	%_retval_ = alloca i32
	%power = alloca %struct.Power*
	%input = alloca i32
	%result = alloca i32
	%exp = alloca i32
	%i = alloca i32
	store i32 0, i32* %result
	%r15 = call i8* @malloc(i32 16)
	%r16 = bitcast i8* %r15 to %struct.Power*
	store %struct.Power* %r16, %struct.Power** %power
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %input)
	%r17 = load %struct.Power*, %struct.Power** %power
	%r18 = getelementptr %struct.Power , %struct.Power* %r17, i1 0, i32 0
	%r19 = load i32, i32* %input
	store i32 %r19, i32* %r18
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %input)
	%r20 = load i32, i32* %input
	%r21 = icmp slt i32 %r20, 0
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L9, label %L10

L9:
	%r24 = sub i32 0, 1
	store i32 %r24, i32* %_retval_
	br label %L8
L10:
	br label %L11
L11:
	%r26 = load %struct.Power*, %struct.Power** %power
	%r27 = getelementptr %struct.Power , %struct.Power* %r26, i1 0, i32 1
	%r28 = load i32, i32* %input
	store i32 %r28, i32* %r27
	store i32 0, i32* %i
	%r38 = load i32, i32* %i
	%r39 = icmp slt i32 %r38, 1000000
	%r40 = zext i1 %r39 to i32
	%r41 = trunc i32 %r40 to i1
	br i1 %r41, label %L13, label %L14

L13:
	%r29 = load i32, i32* %i
	%r30 = add i32 %r29, 1
	store i32 %r30, i32* %i
	%r31 = load %struct.Power*, %struct.Power** %power
	%r32 = getelementptr %struct.Power , %struct.Power* %r31, i1 0, i32 0
	%r33 = load i32, i32* %r32
	%r34 = load %struct.Power*, %struct.Power** %power
	%r35 = getelementptr %struct.Power , %struct.Power* %r34, i1 0, i32 1
	%r36 = load i32, i32* %r35
	%r37 = call i32 @calcPower(i32 %r33, i32 %r36 )
	store i32 %r37, i32* %result
	%r42 = load i32, i32* %i
	%r43 = icmp slt i32 %r42, 1000000
	%r44 = zext i1 %r43 to i32
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L13, label %L14

L14:
	%r46 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r46)
	store i32 1, i32* %_retval_
	br label %L8
L8:
	%r25 = load i32, i32* %_retval_
	ret i32 %r25
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
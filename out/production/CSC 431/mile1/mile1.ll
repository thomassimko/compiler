target triple="i686"

%struct.Power = type {i32, i32}

define i32 @calcPower(i32 %_P_base, i32 %_P_exp)
{

L1:
	%_retval_ = alloca i32
	%base = alloca i32
	store i32 %_P_base, i32* %base
	%exp = alloca i32
	store i32 %_P_exp, i32* %exp
	%result = alloca i32
	store i32 1, i32* %result
	%r0 = load i32, i32* %exp
	%r1 = icmp sgt i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	%r4 = load i32, i32* %result
	%r5 = load i32, i32* %base
	%r6 = mul i32 %r4, %r5
	store i32 %r6, i32* %result
	%r7 = load i32, i32* %exp
	%r8 = sub i32 %r7, 1
	store i32 %r8, i32* %exp
	%r9 = load i32, i32* %exp
	%r10 = icmp sgt i32 %r9, 0
	%r11 = zext i1 %r10 to i32
	%r12 = trunc i32 %r11 to i1
	br i1 %r12, label %L3, label %L4

L4:
	%r13 = load i32, i32* %result
	store i32 %r13, i32* %_retval_
	br label %L2
L2:
	%r14 = load i32, i32* %_retval_
	ret i32 %r14
}

define i32 @main()
{

L6:
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
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r17 = load i32, i32* @.read_scratch
	store i32 %r17, i32* %input
	%r18 = load i32, i32* %input
	%r19 = load %struct.Power*, %struct.Power** %power
	%r20 = getelementptr %struct.Power , %struct.Power* %r19, i1 0, i32 0
	store i32 %r18, i32* %r20
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r21 = load i32, i32* @.read_scratch
	store i32 %r21, i32* %input
	%r22 = load i32, i32* %input
	%r23 = icmp slt i32 %r22, 0
	%r24 = zext i1 %r23 to i32
	%r25 = trunc i32 %r24 to i1
	br i1 %r25, label %L8, label %L9

L8:
	%r26 = sub i32 0, 1
	store i32 %r26, i32* %_retval_
	br label %L7
L9:
	br label %L10
L10:
	%r28 = load i32, i32* %input
	%r29 = load %struct.Power*, %struct.Power** %power
	%r30 = getelementptr %struct.Power , %struct.Power* %r29, i1 0, i32 1
	store i32 %r28, i32* %r30
	store i32 0, i32* %i
	%r31 = load i32, i32* %i
	%r32 = icmp slt i32 %r31, 1000000
	%r33 = zext i1 %r32 to i32
	%r34 = trunc i32 %r33 to i1
	br i1 %r34, label %L11, label %L12

L11:
	%r35 = load i32, i32* %i
	%r36 = add i32 %r35, 1
	store i32 %r36, i32* %i
	%r37 = load %struct.Power*, %struct.Power** %power
	%r38 = getelementptr %struct.Power , %struct.Power* %r37, i1 0, i32 0
	%r39 = load i32, i32* %r38
	%r40 = load %struct.Power*, %struct.Power** %power
	%r41 = getelementptr %struct.Power , %struct.Power* %r40, i1 0, i32 1
	%r42 = load i32, i32* %r41
	%r43 = call i32 @calcPower(i32 %r39, i32 %r42 )
	store i32 %r43, i32* %result
	%r44 = load i32, i32* %i
	%r45 = icmp slt i32 %r44, 1000000
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L11, label %L12

L12:
	%r48 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r48)
	store i32 1, i32* %_retval_
	br label %L7
L7:
	%r27 = load i32, i32* %_retval_
	ret i32 %r27
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
target triple="i686"

%struct.Power = type {i32, i32}

define i32 @calcPower(i32 %base, i32 %exp)
{

L1:
	%r0 = icmp sgt i32 %exp, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%r3 = phi i32 [1, %L1], [%r5, %L3]
	%r4 = phi i32 [%base, %L1], [%r4, %L3]
	%r6 = phi i32 [%exp, %L1], [%r7, %L3]
	%r5 = mul i32 %r3, %r4
	%r7 = sub i32 %r6, 1
	%r8 = icmp sgt i32 %r7, 0
	%r9 = zext i1 %r8 to i32
	%r10 = trunc i32 %r9 to i1
	br i1 %r10, label %L3, label %L4

L4:
	%r11 = phi i32 [1, %L1], [%r5, %L3]
	br label %L2
L2:
	ret i32 %r11
}

define i32 @main()
{

L6:
	%r13 = call i8* @malloc(i32 16)
	%r14 = bitcast i8* %r13 to %struct.Power*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r15 = load i32, i32* @.read_scratch
	%r16 = getelementptr %struct.Power , %struct.Power* %r14, i1 0, i32 0
	store i32 %r15, i32* %r16
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r17 = load i32, i32* @.read_scratch
	%r18 = icmp slt i32 %r17, 0
	%r19 = zext i1 %r18 to i32
	%r20 = trunc i32 %r19 to i1
	br i1 %r20, label %L8, label %L9

L8:
	%r21 = sub i32 0, 1
	br label %L7
L9:
	br label %L10
L10:
	%r22 = getelementptr %struct.Power , %struct.Power* %r14, i1 0, i32 1
	store i32 %r17, i32* %r22
	br i1 1, label %L11, label %L12

L11:
	%r26 = phi i32 [0, %L10], [%r27, %L11]
	%r28 = phi %struct.Power* [%r14, %L10], [%r28, %L11]
	%r27 = add i32 %r26, 1
	%r29 = getelementptr %struct.Power , %struct.Power* %r28, i1 0, i32 0
	%r30 = load i32, i32* %r29
	%r31 = getelementptr %struct.Power , %struct.Power* %r28, i1 0, i32 1
	%r32 = load i32, i32* %r31
	%r33 = call i32 @calcPower(i32 %r30, i32 %r32 )
	%r34 = icmp slt i32 %r27, 1000000
	%r35 = zext i1 %r34 to i32
	%r36 = trunc i32 %r35 to i1
	br i1 %r36, label %L11, label %L12

L12:
	%r37 = phi i32 [0, %L10], [%r33, %L11]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r37)
	br label %L7
L7:
	%r38 = phi i32 [-1, %L8], [1, %L12]
	ret i32 %r38
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
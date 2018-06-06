target triple="i686"



define i32 @wait(i32 %waitTime)
{

L1:
	%r0 = icmp sgt i32 %waitTime, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%r3 = phi i32 [%waitTime, %L1], [%r4, %L3]
	%r4 = sub i32 %r3, 1
	%r5 = icmp sgt i32 %r4, 0
	%r6 = zext i1 %r5 to i32
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L3, label %L4

L4:
	br label %L2
L2:
	ret i32 0
}

define i32 @power(i32 %base, i32 %exponent)
{

L6:
	%r9 = icmp sgt i32 %exponent, 0
	%r10 = zext i1 %r9 to i32
	%r11 = trunc i32 %r10 to i1
	br i1 %r11, label %L8, label %L9

L8:
	%r12 = phi i32 [1, %L6], [%r14, %L8]
	%r13 = phi i32 [%base, %L6], [%r13, %L8]
	%r15 = phi i32 [%exponent, %L6], [%r16, %L8]
	%r14 = mul i32 %r12, %r13
	%r16 = sub i32 %r15, 1
	%r17 = icmp sgt i32 %r16, 0
	%r18 = zext i1 %r17 to i32
	%r19 = trunc i32 %r18 to i1
	br i1 %r19, label %L8, label %L9

L9:
	%r20 = phi i32 [1, %L6], [%r14, %L8]
	br label %L7
L7:
	ret i32 %r20
}

define i32 @recursiveDecimalSum(i32 %binaryNum, i32 %decimalSum, i32 %recursiveDepth)
{

L11:
	%r22 = icmp sgt i32 %binaryNum, 0
	%r23 = zext i1 %r22 to i32
	%r24 = trunc i32 %r23 to i1
	br i1 %r24, label %L13, label %L14

L13:
	%r25 = sdiv i32 %binaryNum, 10
	%r26 = mul i32 %r25, 10
	%r27 = sub i32 %binaryNum, %r26
	%r28 = icmp eq i32 %r27, 1
	%r29 = zext i1 %r28 to i32
	%r30 = trunc i32 %r29 to i1
	br i1 %r30, label %L16, label %L17

L14:
	br label %L15
L15:
	br label %L12
L16:
	%r31 = call i32 @power(i32 2, i32 %recursiveDepth )
	%r32 = add i32 %decimalSum, %r31
	br label %L18
L17:
	br label %L18
L18:
	%r33 = phi i32 [%binaryNum, %L16], [%binaryNum, %L17]
	%r35 = phi i32 [%r32, %L16], [%decimalSum, %L17]
	%r36 = phi i32 [%recursiveDepth, %L16], [%recursiveDepth, %L17]
	%r34 = sdiv i32 %r33, 10
	%r37 = add i32 %r36, 1
	%r38 = call i32 @recursiveDecimalSum(i32 %r34, i32 %r35, i32 %r37 )
	br label %L12
L12:
	%r39 = phi i32 [%r38, %L18], [%decimalSum, %L15]
	ret i32 %r39
}

define i32 @main()
{

L23:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r42 = load i32, i32* @.read_scratch
	%r40 = call i32 @recursiveDecimalSum(i32 %r42, i32 0, i32 0 )
	%r44 = mul i32 %r40, %r40
	%r45 = icmp sgt i32 %r44, 0
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L25, label %L26

L25:
	%r48 = phi i32 [%r44, %L23], [%r49, %L25]
	%r54 = phi i32 [%r40, %L23], [%r54, %L25]
	call i32 @wait(i32 %r48 )
	%r49 = sub i32 %r48, 1
	%r50 = icmp sgt i32 %r49, 0
	%r51 = zext i1 %r50 to i32
	%r52 = trunc i32 %r51 to i1
	br i1 %r52, label %L25, label %L26

L26:
	%r53 = phi i32 [%r40, %L23], [%r54, %L25]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r53)
	br label %L24
L24:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
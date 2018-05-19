target triple="i686"



define i32 @wait(i32 %waitTime)
{

L1:
	%r0 = icmp sgt i32 %waitTime, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%phi0 = phi i32 [%waitTime, %L1], [%r3, %L3]
	%r3 = sub i32 %phi0, 1
	%r4 = icmp sgt i32 %r3, 0
	%r5 = zext i1 %r4 to i32
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L3, label %L4

L4:
	br label %L2
L2:
	%phi1 = phi i32 [0, %L4]
	ret i32 %phi1
}

define i32 @power(i32 %base, i32 %exponent)
{

L6:
	%r7 = icmp sgt i32 %exponent, 0
	%r8 = zext i1 %r7 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L8, label %L9

L8:
	%phi2 = phi i32 [1, %L6], [%r10, %L8]
	%phi3 = phi i32 [%base, %L6], [%phi3, %L8]
	%phi4 = phi i32 [%exponent, %L6], [%r11, %L8]
	%r10 = mul i32 %phi2, %phi3
	%r11 = sub i32 %phi4, 1
	%r12 = icmp sgt i32 %r11, 0
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L8, label %L9

L9:
	%phi5 = phi i32 [1, %L6], [%r10, %L8]
	br label %L7
L7:
	%phi6 = phi i32 [%phi5, %L9]
	ret i32 %phi6
}

define i32 @recursiveDecimalSum(i32 %binaryNum, i32 %decimalSum, i32 %recursiveDepth)
{

L11:
	%r15 = icmp sgt i32 %binaryNum, 0
	%r16 = zext i1 %r15 to i32
	%r17 = trunc i32 %r16 to i1
	br i1 %r17, label %L13, label %L14

L13:
	%r18 = sdiv i32 %binaryNum, 10
	%r19 = mul i32 %r18, 10
	%r20 = sub i32 %binaryNum, %r19
	%r21 = icmp eq i32 %r20, 1
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L16, label %L17

L14:
	br label %L15
L15:
	br label %L12
L16:
	%r24 = call i32 @power(i32 2, i32 %recursiveDepth )
	%r25 = add i32 %decimalSum, %r24
	br label %L18
L17:
	br label %L18
L18:
	%phi7 = phi i32 [%binaryNum, %L16], [%binaryNum, %L17]
	%phi8 = phi i32 [%r25, %L16], [%decimalSum, %L17]
	%phi9 = phi i32 [%recursiveDepth, %L16], [%recursiveDepth, %L17]
	%r26 = sdiv i32 %phi7, 10
	%r27 = add i32 %phi9, 1
	%r28 = call i32 @recursiveDecimalSum(i32 %r26, i32 %phi8, i32 %r27 )
	br label %L12
L12:
	%phi10 = phi i32 [%r28, %L18], [%decimalSum, %L15]
	ret i32 %phi10
}

define i32 @convertToDecimal(i32 %binaryNum)
{

L20:
	%r29 = call i32 @recursiveDecimalSum(i32 %binaryNum, i32 0, i32 0 )
	br label %L21
L21:
	%phi11 = phi i32 [%r29, %L20]
	ret i32 %phi11
}

define i32 @main()
{

L23:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r30 = load i32, i32* @.read_scratch
	%r31 = call i32 @convertToDecimal(i32 %r30 )
	%r32 = mul i32 %r31, %r31
	%r33 = icmp sgt i32 %r32, 0
	%r34 = zext i1 %r33 to i32
	%r35 = trunc i32 %r34 to i1
	br i1 %r35, label %L25, label %L26

L25:
	%phi12 = phi i32 [%r32, %L23], [%r36, %L25]
	%phi14 = phi i32 [%r31, %L23], [%phi14, %L25]
	call i32 @wait(i32 %phi12 )
	%r36 = sub i32 %phi12, 1
	%r37 = icmp sgt i32 %r36, 0
	%r38 = zext i1 %r37 to i32
	%r39 = trunc i32 %r38 to i1
	br i1 %r39, label %L25, label %L26

L26:
	%phi13 = phi i32 [%r31, %L23], [%phi14, %L25]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi13)
	br label %L24
L24:
	%phi15 = phi i32 [0, %L26]
	ret i32 %phi15
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
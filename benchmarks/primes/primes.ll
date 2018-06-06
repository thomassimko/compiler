target triple="i686"



define i32 @isqrt(i32 %a)
{

L1:
	%r0 = icmp sle i32 1, %a
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%r3 = phi i32 [1, %L1], [%r5, %L3]
	%r4 = phi i32 [3, %L1], [%r6, %L3]
	%r7 = phi i32 [%a, %L1], [%r7, %L3]
	%r5 = add i32 %r3, %r4
	%r6 = add i32 %r4, 2
	%r8 = icmp sle i32 %r5, %r7
	%r9 = zext i1 %r8 to i32
	%r10 = trunc i32 %r9 to i1
	br i1 %r10, label %L3, label %L4

L4:
	%r11 = phi i32 [3, %L1], [%r6, %L3]
	%r12 = sdiv i32 %r11, 2
	%r13 = sub i32 %r12, 1
	br label %L2
L2:
	ret i32 %r13
}

define i32 @prime(i32 %a)
{

L6:
	%r15 = icmp slt i32 %a, 2
	%r16 = zext i1 %r15 to i32
	%r17 = trunc i32 %r16 to i1
	br i1 %r17, label %L8, label %L9

L8:
	%r18 = zext i1 0 to i32
	br label %L7
L9:
	%r19 = call i32 @isqrt(i32 %a )
	%r20 = icmp sle i32 2, %r19
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L11, label %L12

L11:
	%r23 = phi i32 [%a, %L9], [%r23, %L15]
	%r24 = phi i32 [2, %L9], [%r32, %L15]
	%r33 = phi i32 [%r19, %L9], [%r33, %L15]
	%r25 = sdiv i32 %r23, %r24
	%r26 = mul i32 %r25, %r24
	%r27 = sub i32 %r23, %r26
	%r28 = icmp eq i32 %r27, 0
	%r29 = zext i1 %r28 to i32
	%r30 = trunc i32 %r29 to i1
	br i1 %r30, label %L13, label %L14

L13:
	%r31 = zext i1 0 to i32
	br label %L7
L14:
	br label %L15
L15:
	%r32 = add i32 %r24, 1
	%r34 = icmp sle i32 %r32, %r33
	%r35 = zext i1 %r34 to i32
	%r36 = trunc i32 %r35 to i1
	br i1 %r36, label %L11, label %L12

L12:
	%r37 = zext i1 1 to i32
	br label %L7
L7:
	%r38 = phi i32 [0, %L8], [0, %L13], [1, %L12]
	ret i32 %r38
}

define i32 @main()
{

L17:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r39 = load i32, i32* @.read_scratch
	%r40 = icmp sle i32 0, %r39
	%r41 = zext i1 %r40 to i32
	%r42 = trunc i32 %r41 to i1
	br i1 %r42, label %L19, label %L20

L19:
	%r43 = phi i32 [0, %L17], [%r47, %L23]
	%r49 = phi i32 [%r39, %L17], [%r48, %L23]
	%r44 = call i32 @prime(i32 %r43 )
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L21, label %L22

L21:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r43)
	br label %L23
L22:
	br label %L23
L23:
	%r46 = phi i32 [%r43, %L21], [%r43, %L22]
	%r48 = phi i32 [%r49, %L21], [%r49, %L22]
	%r47 = add i32 %r46, 1
	%r50 = icmp sle i32 %r47, %r48
	%r51 = zext i1 %r50 to i32
	%r52 = trunc i32 %r51 to i1
	br i1 %r52, label %L19, label %L20

L20:
	br label %L18
L18:
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
target triple="i686"

%struct.IntHolder = type {i32}
@interval = common global i32 0, align 8
@end = common global i32 0, align 8

define i32 @multBy4xTimes(%struct.IntHolder* %num, i32 %timesLeft)
{

L1:
	%r0 = icmp sle i32 %timesLeft, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%r3 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r4 = load i32, i32* %r3
	br label %L2
L4:
	br label %L5
L5:
	%r5 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r6 = load i32, i32* %r5
	%r7 = mul i32 4, %r6
	%r8 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	store i32 %r7, i32* %r8
	%r9 = sub i32 %timesLeft, 1
	call i32 @multBy4xTimes(%struct.IntHolder* %num, i32 %r9 )
	%r10 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r11 = load i32, i32* %r10
	br label %L2
L2:
	%phi0 = phi i32 [%r4, %L3], [%r11, %L5]
	ret i32 %phi0
}

define void @divideBy8(%struct.IntHolder* %num)
{

L7:
	%r12 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r13 = load i32, i32* %r12
	%r14 = sdiv i32 %r13, 2
	%r15 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	store i32 %r14, i32* %r15
	%r16 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r17 = load i32, i32* %r16
	%r18 = sdiv i32 %r17, 2
	%r19 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	store i32 %r18, i32* %r19
	%r20 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	%r21 = load i32, i32* %r20
	%r22 = sdiv i32 %r21, 2
	%r23 = getelementptr %struct.IntHolder , %struct.IntHolder* %num, i1 0, i32 0
	store i32 %r22, i32* %r23
	br label %L8
L8:
	ret void
}

define i32 @main()
{

L10:
	%r24 = call i8* @malloc(i32 8)
	%r25 = bitcast i8* %r24 to %struct.IntHolder*
	store i32 1000000, i32* @end
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r26 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r27 = load i32, i32* @.read_scratch
	store i32 %r27, i32* @interval
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r26)
	%r28 = load i32, i32* @interval
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r28)
	%r29 = icmp slt i32 0, 50
	%r30 = zext i1 %r29 to i32
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L12, label %L13

L12:
	%phi5 = phi %struct.IntHolder* [%r25, %L10], [%phi11, %L15]
	%phi8 = phi i32 [0, %L10], [%r62, %L15]
	%phi16 = phi i32 [0, %L10], [%phi15, %L15]
	%r32 = load i32, i32* @end
	%r33 = icmp sle i32 0, %r32
	%r34 = zext i1 %r33 to i32
	%r35 = trunc i32 %r34 to i1
	br i1 %r35, label %L14, label %L15

L14:
	%phi1 = phi i32 [0, %L12], [%r57, %L18]
	%phi2 = phi %struct.IntHolder* [%phi5, %L12], [%phi6, %L18]
	%phi10 = phi i32 [%phi8, %L12], [%phi9, %L18]
	%r36 = mul i32 1, 2
	%r37 = mul i32 %r36, 3
	%r38 = mul i32 %r37, 4
	%r39 = mul i32 %r38, 5
	%r40 = mul i32 %r39, 6
	%r41 = mul i32 %r40, 7
	%r42 = mul i32 %r41, 8
	%r43 = mul i32 %r42, 9
	%r44 = mul i32 %r43, 10
	%r45 = mul i32 %r44, 11
	%r46 = add i32 %phi1, 1
	%r47 = getelementptr %struct.IntHolder , %struct.IntHolder* %phi2, i1 0, i32 0
	store i32 %r46, i32* %r47
	%r48 = getelementptr %struct.IntHolder , %struct.IntHolder* %phi2, i1 0, i32 0
	%r49 = load i32, i32* %r48
	call i32 @multBy4xTimes(%struct.IntHolder* %phi2, i32 2 )
	call void @divideBy8(%struct.IntHolder* %phi2 )
	%r50 = load i32, i32* @interval
	%r51 = sub i32 %r50, 1
	%r52 = icmp sle i32 %r51, 0
	%r53 = zext i1 %r52 to i32
	%r54 = icmp sle i32 %r51, 0
	%r55 = zext i1 %r54 to i32
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L16, label %L17

L16:
	br label %L18
L17:
	br label %L18
L18:
	%phi3 = phi i32 [%r46, %L16], [%r46, %L17]
	%phi4 = phi i32 [1, %L16], [%r51, %L17]
	%phi6 = phi %struct.IntHolder* [%phi2, %L16], [%phi2, %L17]
	%phi9 = phi i32 [%phi10, %L16], [%phi10, %L17]
	%phi17 = phi i32 [%r45, %L16], [%r45, %L17]
	%r57 = add i32 %phi3, %phi4
	%r58 = load i32, i32* @end
	%r59 = icmp sle i32 %r57, %r58
	%r60 = zext i1 %r59 to i32
	%r61 = trunc i32 %r60 to i1
	br i1 %r61, label %L14, label %L15

L15:
	%phi7 = phi i32 [%phi8, %L12], [%phi9, %L18]
	%phi11 = phi %struct.IntHolder* [%phi5, %L12], [%phi6, %L18]
	%phi13 = phi i32 [0, %L12], [%r57, %L18]
	%phi15 = phi i32 [%phi16, %L12], [%phi17, %L18]
	%r62 = add i32 %phi7, 1
	%r63 = icmp slt i32 %r62, 50
	%r64 = zext i1 %r63 to i32
	%r65 = trunc i32 %r64 to i1
	br i1 %r65, label %L12, label %L13

L13:
	%phi12 = phi i32 [0, %L10], [%phi13, %L15]
	%phi14 = phi i32 [0, %L10], [%phi15, %L15]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi12)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi14)
	br label %L11
L11:
	%phi18 = phi i32 [0, %L13]
	ret i32 %phi18
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
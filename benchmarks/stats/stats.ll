target triple="i686"

%struct.linkedNums = type {%struct.linkedNums*, i32}

define %struct.linkedNums* @getRands(i32 %seed, i32 %num)
{

L1:
	%r0 = mul i32 %seed, %seed
	%r1 = call i8* @malloc(i32 16)
	%r2 = bitcast i8* %r1 to %struct.linkedNums*
	%r3 = getelementptr %struct.linkedNums , %struct.linkedNums* %r2, i1 0, i32 1
	store i32 %r0, i32* %r3
	%r4 = getelementptr %struct.linkedNums , %struct.linkedNums* %r2, i1 0, i32 0
	store %struct.linkedNums* null, %struct.linkedNums** %r4
	%r5 = sub i32 %num, 1
	%r6 = icmp sgt i32 %r5, 0
	%r7 = zext i1 %r6 to i32
	%r8 = trunc i32 %r7 to i1
	br i1 %r8, label %L3, label %L4

L3:
	%phi0 = phi i32 [%r0, %L1], [%r13, %L3]
	%phi1 = phi i32 [%seed, %L1], [%phi1, %L3]
	%phi2 = phi %struct.linkedNums* [%r2, %L1], [%r15, %L3]
	%phi3 = phi i32 [%r5, %L1], [%r18, %L3]
	%r9 = mul i32 %phi0, %phi0
	%r10 = sdiv i32 %r9, %phi1
	%r11 = sdiv i32 %phi1, 2
	%r12 = mul i32 %r10, %r11
	%r13 = add i32 %r12, 1
	%r14 = call i8* @malloc(i32 16)
	%r15 = bitcast i8* %r14 to %struct.linkedNums*
	%r16 = getelementptr %struct.linkedNums , %struct.linkedNums* %r15, i1 0, i32 1
	store i32 %r13, i32* %r16
	%r17 = getelementptr %struct.linkedNums , %struct.linkedNums* %r15, i1 0, i32 0
	store %struct.linkedNums* %phi2, %struct.linkedNums** %r17
	%r18 = sub i32 %phi3, 1
	%r19 = icmp sgt i32 %r18, 0
	%r20 = zext i1 %r19 to i32
	%r21 = trunc i32 %r20 to i1
	br i1 %r21, label %L3, label %L4

L4:
	%phi4 = phi %struct.linkedNums* [null, %L1], [%r15, %L3]
	br label %L2
L2:
	%phi5 = phi %struct.linkedNums* [%phi4, %L4]
	ret %struct.linkedNums* %phi5
}

define i32 @calcMean(%struct.linkedNums* %nums)
{

L6:
	%r22 = icmp ne %struct.linkedNums* %nums, null
	%r23 = zext i1 %r22 to i32
	%r24 = trunc i32 %r23 to i1
	br i1 %r24, label %L8, label %L9

L8:
	%phi6 = phi i32 [0, %L6], [%r25, %L8]
	%phi7 = phi i32 [0, %L6], [%r28, %L8]
	%phi8 = phi %struct.linkedNums* [%nums, %L6], [%r30, %L8]
	%phi13 = phi i32 [0, %L6], [%phi13, %L8]
	%r25 = add i32 %phi6, 1
	%r26 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi8, i1 0, i32 1
	%r27 = load i32, i32* %r26
	%r28 = add i32 %phi7, %r27
	%r29 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi8, i1 0, i32 0
	%r30 = load %struct.linkedNums*, %struct.linkedNums** %r29
	%r31 = icmp ne %struct.linkedNums* %r30, null
	%r32 = zext i1 %r31 to i32
	%r33 = trunc i32 %r32 to i1
	br i1 %r33, label %L8, label %L9

L9:
	%phi9 = phi i32 [0, %L6], [%r25, %L8]
	%phi10 = phi i32 [0, %L6], [%r28, %L8]
	%phi12 = phi i32 [0, %L6], [%phi13, %L8]
	%r34 = icmp ne i32 %phi9, 0
	%r35 = zext i1 %r34 to i32
	%r36 = trunc i32 %r35 to i1
	br i1 %r36, label %L10, label %L11

L10:
	%r37 = sdiv i32 %phi10, %phi9
	br label %L12
L11:
	br label %L12
L12:
	%phi11 = phi i32 [%r37, %L10], [%phi12, %L11]
	br label %L7
L7:
	%phi14 = phi i32 [%phi11, %L12]
	ret i32 %phi14
}

define i32 @approxSqrt(i32 %num)
{

L14:
	%r38 = icmp slt i32 0, %num
	%r39 = zext i1 %r38 to i32
	%r40 = trunc i32 %r39 to i1
	br i1 %r40, label %L16, label %L17

L16:
	%phi15 = phi i32 [1, %L14], [%r42, %L16]
	%phi16 = phi i32 [%num, %L14], [%phi16, %L16]
	%r41 = mul i32 %phi15, %phi15
	%r42 = add i32 %phi15, 1
	%r43 = icmp slt i32 %r41, %phi16
	%r44 = zext i1 %r43 to i32
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L16, label %L17

L17:
	%phi17 = phi i32 [1, %L14], [%phi15, %L16]
	br label %L15
L15:
	%phi18 = phi i32 [%phi17, %L17]
	ret i32 %phi18
}

define void @approxSqrtAll(%struct.linkedNums* %nums)
{

L19:
	%r46 = icmp ne %struct.linkedNums* %nums, null
	%r47 = zext i1 %r46 to i32
	%r48 = trunc i32 %r47 to i1
	br i1 %r48, label %L21, label %L22

L21:
	%phi19 = phi %struct.linkedNums* [%nums, %L19], [%r53, %L21]
	%r49 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi19, i1 0, i32 1
	%r50 = load i32, i32* %r49
	%r51 = call i32 @approxSqrt(i32 %r50 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r51)
	%r52 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi19, i1 0, i32 0
	%r53 = load %struct.linkedNums*, %struct.linkedNums** %r52
	%r54 = icmp ne %struct.linkedNums* %r53, null
	%r55 = zext i1 %r54 to i32
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L21, label %L22

L22:
	br label %L20
L20:
	ret void
}

define void @range(%struct.linkedNums* %nums)
{

L24:
	%r57 = zext i1 1 to i32
	%r58 = icmp ne %struct.linkedNums* %nums, null
	%r59 = zext i1 %r58 to i32
	%r60 = trunc i32 %r59 to i1
	br i1 %r60, label %L26, label %L27

L26:
	%phi20 = phi i32 [%r57, %L24], [%phi27, %L30]
	%phi21 = phi %struct.linkedNums* [%nums, %L24], [%r82, %L30]
	%phi22 = phi i32 [0, %L24], [%phi30, %L30]
	%phi23 = phi i32 [0, %L24], [%phi33, %L30]
	%r61 = trunc i32 %phi20 to i1
	br i1 %r61, label %L28, label %L29

L28:
	%r62 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi21, i1 0, i32 1
	%r63 = load i32, i32* %r62
	%r64 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi21, i1 0, i32 1
	%r65 = load i32, i32* %r64
	%r66 = zext i1 0 to i32
	br label %L30
L29:
	%r67 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi21, i1 0, i32 1
	%r68 = load i32, i32* %r67
	%r69 = icmp slt i32 %r68, %phi22
	%r70 = zext i1 %r69 to i32
	%r71 = trunc i32 %r70 to i1
	br i1 %r71, label %L31, label %L32

L30:
	%phi24 = phi %struct.linkedNums* [%phi21, %L28], [%phi25, %L33]
	%phi27 = phi i32 [%r66, %L28], [%phi28, %L33]
	%phi30 = phi i32 [%r63, %L28], [%phi31, %L33]
	%phi33 = phi i32 [%r65, %L28], [%phi34, %L33]
	%r81 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi24, i1 0, i32 0
	%r82 = load %struct.linkedNums*, %struct.linkedNums** %r81
	%r83 = icmp ne %struct.linkedNums* %r82, null
	%r84 = zext i1 %r83 to i32
	%r85 = trunc i32 %r84 to i1
	br i1 %r85, label %L26, label %L27

L31:
	%r72 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi21, i1 0, i32 1
	%r73 = load i32, i32* %r72
	br label %L33
L32:
	%r74 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi21, i1 0, i32 1
	%r75 = load i32, i32* %r74
	%r76 = icmp sgt i32 %r75, %phi23
	%r77 = zext i1 %r76 to i32
	%r78 = trunc i32 %r77 to i1
	br i1 %r78, label %L34, label %L35

L33:
	%phi25 = phi %struct.linkedNums* [%phi21, %L31], [%phi26, %L36]
	%phi28 = phi i32 [%phi20, %L31], [%phi29, %L36]
	%phi31 = phi i32 [%r73, %L31], [%phi32, %L36]
	%phi34 = phi i32 [%phi23, %L31], [%phi35, %L36]
	br label %L30
L34:
	%r79 = getelementptr %struct.linkedNums , %struct.linkedNums* %phi21, i1 0, i32 1
	%r80 = load i32, i32* %r79
	br label %L36
L35:
	br label %L36
L36:
	%phi26 = phi %struct.linkedNums* [%phi21, %L34], [%phi21, %L35]
	%phi29 = phi i32 [%phi20, %L34], [%phi20, %L35]
	%phi32 = phi i32 [%phi22, %L34], [%phi22, %L35]
	%phi35 = phi i32 [%r80, %L34], [%phi23, %L35]
	br label %L33
L27:
	%phi36 = phi i32 [0, %L24], [%phi30, %L30]
	%phi37 = phi i32 [0, %L24], [%phi33, %L30]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi36)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi37)
	br label %L25
L25:
	ret void
}

define i32 @main()
{

L38:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r86 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r87 = load i32, i32* @.read_scratch
	%r88 = call %struct.linkedNums* @getRands(i32 %r86, i32 %r87 )
	%r89 = call i32 @calcMean(%struct.linkedNums* %r88 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r89)
	call void @range(%struct.linkedNums* %r88 )
	call void @approxSqrtAll(%struct.linkedNums* %r88 )
	br label %L39
L39:
	%phi38 = phi i32 [0, %L38]
	ret i32 %phi38
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8
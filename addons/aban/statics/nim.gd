class_name AbNim
extends AbStatic


static func play(
	heaps : PoolByteArray,
	misere : bool = false
	) -> PoolByteArray:
	
	if not heaps:
		return PoolByteArray([0, 0])
	
	var is_endgame : bool = false
	if count_non_0_1(heaps) <= 1:
		is_endgame = true
	
	if misere and is_endgame:
		
		var is_odd : bool = false
		if (moves_left(heaps) % 2) == 1:
			is_odd = true
		
		var index_of_max : int = begest_heap(heaps)
		var sizeof_max : int = heaps[index_of_max]
		
#		if sizeof_max == 1 and is_odd:
#			return "You will lose :("
#			pass
		
		return PoolByteArray([index_of_max, sizeof_max - int(is_odd)])
	
	var nim_sum : int = nim_sum(heaps)
	
#	if nim_sum == 0:
#		return "You will lose :("
	
	for i in heaps.size():
		var target_size : int = heaps[i] ^ nim_sum
		if target_size < heaps[i]:
			var amount_to_remove : int = heaps[i] - target_size
			return PoolByteArray([i, amount_to_remove])
	
	for i in heaps.size():
		if heaps[i] > 0:
			return PoolByteArray([i, 1])
	
	return PoolByteArray([0, 0])


static func count_non_0_1(
	heaps : PoolByteArray
	) -> int:
	
	var counter : int = 0
	
	for x in heaps:
		if x > 1:
			counter += 1
	
	return counter


static func moves_left(
	heaps : PoolByteArray
	) -> int:
	
	var counter : int = 0
	
	for x in heaps:
		if x > 0:
			counter += 1
	
	return counter


static func begest_heap(
	heaps : PoolByteArray
	) -> int:
	
	var index : int = 0
	
	for i in heaps.size():
		if heaps[i] > heaps[index]:
			index = i
	
	return index


static func nim_sum(
	heaps : PoolByteArray
	) -> int:
	
	var sum : int
	
	for x in heaps:
		sum ^= x
	
	return sum






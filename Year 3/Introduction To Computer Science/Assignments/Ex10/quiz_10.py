import timeit
import time
import numpy as np
from general_functions_native import *
from general_functions_vec import *

if __name__ == "__main__":
    # Create random data

    sizeA = 500
    A_np = np.random.rand(sizeA, sizeA)
    print(f"shape: {A_np.shape}, size: {A_np.size}")
    A_list = A_np.tolist()  # Convert to list of lists
    B_list = A_list.copy()
    B_np = A_np.copy()

    setup_code = """
import numpy as np
from general_functions_native import mul_mat_native
from general_functions_vec import mul_mat_vec
# We'll assume A_list and A_np are already created
# but we need to get them from __main__
from __main__ import A_list, A_np, B_list, B_np
"""

    # We'll assume A_list and A_np are already created

    Ta = "mul_mat_native(A_list, B_list)" # by column

    Tb = "mul_mat_vec(A_np, B_np)" # by row

    time_native = timeit.timeit(

        stmt=Ta,

        setup=setup_code,

        number=10

    )

    print(f"Native time: {time_native:.6f} seconds")

    time_vec = timeit.timeit(
        stmt=Tb,
        setup=setup_code,
        number=10
    )

    print(f"Vectorized time: {time_vec:.6f} seconds")
    print(f"Ratio time: {time_native / time_vec:.6f}")
#
# size: 250000
# Native time: 448.156432 seconds
# Vectorized time: 0.269334 seconds
# Ratio time: 1663.945488
#4488.875479, 1366.968109, 1505.754135, 2682.272998, 2277.620993, 1895.196105, 2663.480556, 1727.970855' 2076.424807
#
# Process
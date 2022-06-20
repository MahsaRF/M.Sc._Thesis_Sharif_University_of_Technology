# Sharif_M.Sc._Thesis
M.Sc. thesis, Sharif University of Technology, 2013


A high-performance and power-efficient design of Processor cache hierarchy using STT-RAM technology with Multi-Retention Time Intervals


ABSTRACT

Caching techniques have been an efficient mechanism for mitigating the effects of the processor-memory speed gap. Traditional multi-level SRAM-based cache hierarchies, especially in the context of chip multiprocessors (CMPs), present many challenges in area requirements, power consumption, and design complexity. New advancements in technology enable caches to be built from other technologies, such as Spin-transfer torque random access memory (STT-RAM) and Phase-change RAM (PRAM), in both 2D chips or 3D stacked chips. STT-RAM has received increasing attention because of its attractive features: good scalability, zero standby power, non-volatility, and radiation hardness. The use of STT-RAM technology in the last level on-chip caches (e.g., L2 or L3 cache) has been proposed as it minimizes cache leakage power with technology scaling down. Furthermore, the cell area of STT-RAM is only 1/4 that of SRAM. This allows for a much larger cache with the same die footprint, improving overall system performance through reducing cache misses. However, deploying STT-RAM technology in L1 caches is challenging because of the long and power-consuming write operations. In this research proposal, we propose both L1 and lower-level cache designs that use STT-RAM. Our designs use STT-RAM cells with various data retention time and write performances, made possible by different magnetic tunnelling junction (MTJ) designs. For the fast STT-RAM bits with reduced data retention time, a novel dynamic refresh scheme is proposed to maintain the data validity. 
For lower-level caches with relative large cache capacity, we propose a run-time strategy for managing writes between portions of the cache with different retention characteristics so as to maximize the performance and power benefits. A novel contribution, low-overhead and fully-hardware technique is utilized to detect write-intensive data blocks of working set during system operation. This proposal is one year research project.

Keywords – Spin torque transfer RAM, Retention time, Hybrid cache architecture, Power consumption, Performance.

Mahsa Rezaei Firuzkuhi “A high-performance and power-efficient design of processor cache hierarchy using STT-RAM technology with Multi-Retention Time Intervals,” M.Sc. thesis, Sharif University of Technology, 2013


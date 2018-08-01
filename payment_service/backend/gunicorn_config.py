import multiprocessing

bind = "0.0.0.0:3344"
workers = multiprocessing.cpu_count() * 2 + 1
loglevel = "debug"
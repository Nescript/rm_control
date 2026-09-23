# Global unweighted fit over accepted samples since init; c is the applied model.
std_msgs/Header header
string session_id
uint64 model_version
time last_solve_stamp
uint64 sample_count
bool model_valid
bool metrics_valid
bool r2_valid
bool last_solve_success
bool model_accepted
float64 lambda
float64 alpha_ridge
float64 rmse
float64 r2
float64 bias
# Features: 1, v*a, omega*alpha, a^2, alpha^2, abs(v), abs(omega),
# v^2, omega^2, abs(a), abs(alpha), abs(v*omega)
float64[12] c

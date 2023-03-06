# Import packages
import Pkg; Pkg.add("Plots")
using Plots

# Constants
const F = 96485.33289  # Faraday's constant (C/mol)
const R = 8.314462618  # Universal gas constant (J/(mol*K))
const T = 298.15       # Temperature (K)
const n = 2            # Number of electrons transferred per reaction
const A = 1000         # Electrode area (cm^2)

# Fuel cell parameters
const E0 = 1.23        # Standard cell potential (V)
const r = 0.1          # Electrode resistance (ohm.cm^2)
const k = 1.2e-3       # Mass transfer coefficient (cm/s)
const C = 1000         # Concentration of reactants (mol/m^3)
const P = 1            # Pressure (atm)

# Flow rates
n_H2 = LinRange(0, 1, 100)    # Hydrogen flow rate (mol/s)
n_O2 = LinRange(0, 2, 100)    # Oxygen flow rate (mol/s)

# Voltage and current output
V = Float64[]
I = Float64[]

for nH2 in n_H2
    for nO2 in n_O2
        i = n * F * (nH2 - nO2 / 2)   # Current density (A/cm^2)
        E = E0 - r * i / A            # Cell potential (V)
        push!(V, E)
        push!(I, i)
    end
end

# Plot results
plot(I, V, xlabel="Current density (A/cm^2)", ylabel="Cell potential (V)")


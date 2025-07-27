/// @title vinUpliftFund
/// @notice Enables targeted budget allocations to local government units and disaster-struck individuals.
contract vinUpliftFund {
    struct Municipality {
        string name;
        string region;
        uint256 allocatedBudget;
        uint256 disbursedTotal;
        bool isActive;
    }

    struct Beneficiary {
        string name;
        string reason; // e.g. "Bagyong Egay survivor"
        address wallet;
        uint256 receivedAmount;
    }

    mapping(string => Municipality) public municipalities;
    Beneficiary[] public beneficiaries;

    event BudgetAllocated(string municipality, uint256 amount);
    event AidDisbursed(string beneficiary, string municipality, uint256 amount);

    /// @notice Allocate budget to a municipality
    function allocateBudget(string calldata name, string calldata region, uint256 amount) external {
        municipalities[name] = Municipality({
            name: name,
            region: region,
            allocatedBudget: amount,
            disbursedTotal: 0,
            isActive: true
        });
        emit BudgetAllocated(name, amount);
    }

    /// @notice Disburse aid to individual beneficiary
    function disburseAid(
        string calldata beneficiaryName,
        string calldata reason,
        string calldata municipality,
        address wallet,
        uint256 amount
    ) external {
        Municipality storage muni = municipalities[municipality];
        require(muni.isActive, "Municipality not active");
        require(muni.allocatedBudget >= amount, "Insufficient municipal budget");

        beneficiaries.push(Beneficiary({
            name: beneficiaryName,
            reason: reason,
            wallet: wallet,
            receivedAmount: amount
        }));
        muni.allocatedBudget -= amount;
        muni.disbursedTotal += amount;

        payable(wallet).transfer(amount);
        emit AidDisbursed(beneficiaryName, municipality, amount);
    }
}

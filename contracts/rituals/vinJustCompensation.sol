contract vinJustCompensation {
    string public doctrine = "Compensation shall be fair, not excessive, and reflect current technological support.";
    address public initiator;

    struct RolePayGrade {
        string role;
        uint256 baseSalary;
        uint256 aiOptimizationFactor;
        uint256 humanImpactScore;
    }

    mapping(string => RolePayGrade) public salaryLog;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function registerRole(string memory role, uint256 base, uint256 aiFactor, uint256 impactScore) public {
        salaryLog[role] = RolePayGrade(role, base, aiFactor, impactScore);
    }

    function calculateFairSalary(string memory role) public view returns (uint256) {
        RolePayGrade memory r = salaryLog[role];
        uint256 adjustment = (r.baseSalary * r.aiOptimizationFactor) / 100;
        uint256 impactBonus = (r.baseSalary * r.humanImpactScore) / 100;
        return r.baseSalary - adjustment + impactBonus;
    }

    function note() public pure returns (string memory) {
        return "AI support = lower workload → fairer compensation; human care value = honored via bonus.";
    }
}

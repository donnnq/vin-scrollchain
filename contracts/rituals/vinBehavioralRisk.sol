contract vinBehavioralRisk {
    enum RiskTier { Low, Moderate, High }
    struct Profile {
        bool hasConviction;
        bool undocumented;
        RiskTier tier;
    }

    mapping(address => Profile) public riskProfiles;

    event RiskProfileSet(address indexed subject, RiskTier tier);

    function setRiskProfile(address subject, bool conviction, bool undocumented, RiskTier tier) public {
        riskProfiles[subject] = Profile(conviction, undocumented, tier);
        emit RiskProfileSet(subject, tier);
    }

    function getRiskTier(address subject) public view returns (RiskTier) {
        return riskProfiles[subject].tier;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCivicOracle {
    struct CivicPulse {
        uint256 foodSecurity;
        uint256 educationAccess;
        uint256 healthcareReach;
        uint256 publicSentiment; // community mood rating: 0-100
        uint256 dignityScore;    // symbolic index: 0-100
    }

    mapping(string => CivicPulse) public regionPulse;
    mapping(string => uint256) public civicSignalScore;

    event SignalUpdated(string region, uint256 score);

    function updatePulse(
        string memory _region,
        uint256 _food,
        uint256 _education,
        uint256 _health,
        uint256 _sentiment,
        uint256 _dignity
    ) public {
        regionPulse[_region] = CivicPulse(_food, _education, _health, _sentiment, _dignity);
        uint256 score = calculateSignalScore(_region);
        civicSignalScore[_region] = score;
        emit SignalUpdated(_region, score);
    }

    function calculateSignalScore(string memory _region) internal view returns (uint256) {
        CivicPulse memory p = regionPulse[_region];
        uint256 rawScore = (
            p.foodSecurity +
            p.educationAccess +
            p.healthcareReach +
            p.publicSentiment +
            p.dignityScore
        );
        return rawScore / 5;
    }

    function getSignalStrength(string memory _region) public view returns (string memory) {
        uint256 score = civicSignalScore[_region];
        if (score >= 80) return "Civic harmony detected. Reinforce positive momentum.";
        if (score >= 50) return "Stable pulse. Maintain current support.";
        if (score >= 30) return "Low resilience. Consider reallocating resources.";
        return "Critical fragility. Immediate aid and attention required.";
    }
}

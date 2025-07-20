// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract KiligAuraIntensity {
    mapping(address => uint256) public auraScore;
    mapping(address => string) public auraTier;

    event AuraUpdated(address indexed user, uint256 score, string tier);

    function updateAuraScore(address _user, uint256 _testsPassed, uint256 _gasEfficiency) external {
        uint256 score = (_testsPassed * 1000) + (900000 / (_gasEfficiency + 1)); // Avoid div/0
        auraScore[_user] = score;

        if (score > 2500) {
            auraTier[_user] = "Mythstream Luminary";
        } else if (score > 1500) {
            auraTier[_user] = "Scrollkeeper Adept";
        } else {
            auraTier[_user] = "Kilig Trainee";
        }

        emit AuraUpdated(_user, score, auraTier[_user]);
    }

    function getAuraTier(address _user) external view returns (string memory) {
        return auraTier[_user];
    }
}

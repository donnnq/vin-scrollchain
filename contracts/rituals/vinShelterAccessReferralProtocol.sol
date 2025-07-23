// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinShelterAccessReferralProtocol {
    address public scrollkeeper;

    struct HousingReferral {
        string familyName;
        string currentSituation;
        bool referredToAid;
        string aidProgramLinked;
        uint256 timestamp;
    }

    HousingReferral[] public referrals;

    event HousingAidTriggered(string familyName, string aidProgram);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function referFamily(string memory familyName, string memory currentSituation, string memory aidProgramLinked) external onlyScrollkeeper {
        referrals.push(HousingReferral(familyName, currentSituation, true, aidProgramLinked, block.timestamp));
        emit HousingAidTriggered(familyName, aidProgramLinked);
    }

    function getReferral(uint256 index) external view returns (string memory, string memory, bool, string memory, uint256) {
        HousingReferral memory r = referrals[index];
        return (r.familyName, r.currentSituation, r.referredToAid, r.aidProgramLinked, r.timestamp);
    }

    function totalReferrals() external view returns (uint256) {
        return referrals.length;
    }
}

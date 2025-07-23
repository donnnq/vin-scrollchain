// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfDisplacedSoulRituals {
    address public scrollkeeper;

    struct Ritual {
        string beneficiary;
        string ritualType;
        string emotion;
        uint256 timestamp;
    }

    Ritual[] public rituals;

    event RitualLogged(string beneficiary, string ritualType);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logRitual(string memory beneficiary, string memory ritualType, string memory emotion) external onlyScrollkeeper {
        rituals.push(Ritual(beneficiary, ritualType, emotion, block.timestamp));
        emit RitualLogged(beneficiary, ritualType);
    }

    function getRitual(uint256 index) external view returns (string memory, string memory, string memory, uint256) {
        Ritual memory r = rituals[index];
        return (r.beneficiary, r.ritualType, r.emotion, r.timestamp);
    }

    function totalRituals() external view returns (uint256) {
        return rituals.length;
    }
}

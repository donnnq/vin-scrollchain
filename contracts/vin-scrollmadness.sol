// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollMadness {
    struct Madness {
        string chant;
        string trigger; // e.g. "Portfolio -15%", "Oracle Glitch", "Scroll Overload"
        address summoner;
        address[] companions;
        uint256 timestamp;
    }

    Madness[] public madnessEvents;
    address public immutable madnessCaller;

    event MadnessSurge(uint256 indexed id, string chant, string trigger, address summoner, uint256 timestamp);
    event CompanionSummoned(uint256 indexed id, address companion, uint256 timestamp);

    modifier onlyCaller() {
        require(msg.sender == madnessCaller, "Not the madness caller");
        _;
    }

    constructor() {
        madnessCaller = msg.sender;
    }

    function summonMadness(
        string calldata chant,
        string calldata trigger
    ) external onlyCaller {
        madnessEvents.push(Madness({
            chant: chant,
            trigger: trigger,
            summoner: msg.sender,
            companions: new address[](0),
            timestamp: block.timestamp
        }));

        emit MadnessSurge(madnessEvents.length - 1, chant, trigger, msg.sender, block.timestamp);
    }

    function summonCompanion(uint256 id, address companion) external onlyCaller {
        require(id < madnessEvents.length, "Invalid madness ID");
        madnessEvents[id].companions.push(companion);
        emit CompanionSummoned(id, companion, block.timestamp);
    }

    function getMadness(uint256 id) external view returns (Madness memory) {
        require(id < madnessEvents.length, "Invalid madness ID");
        return madnessEvents[id];
    }

    function totalMadnessEvents() external view returns (uint256) {
        return madnessEvents.length;
    }
}
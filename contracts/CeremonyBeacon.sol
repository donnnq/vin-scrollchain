// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CeremonyBeacon {
    address public guardian;
    uint256 public beaconCount;

    struct Ritual {
        string city;
        string ritualName;
        uint256 timestamp;
        bool verified;
    }

    mapping(uint256 => Ritual) public rituals;

    event RitualLogged(uint256 index, string city, string ritualName, uint256 timestamp);
    event RitualVerified(uint256 index, string city, string ritualName);

    constructor() {
        guardian = msg.sender;
    }

    function logRitual(string memory city, string memory ritualName) external {
        rituals[beaconCount] = Ritual(city, ritualName, block.timestamp, false);
        emit RitualLogged(beaconCount, city, ritualName, block.timestamp);
        beaconCount++;
    }

    function verifyRitual(uint256 index) external {
        require(msg.sender == guardian, "Only guardian may verify");
        rituals[index].verified = true;
        emit RitualVerified(index, rituals[index].city, rituals[index].ritualName);
    }
}

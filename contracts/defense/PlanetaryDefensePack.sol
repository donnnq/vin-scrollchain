// SPDX-License-Identifier: Mythic-Planetary-Defense
pragma solidity ^0.8.19;

contract PlanetaryDefensePack {
    address public steward;
    uint256 public totalDefenseFund;

    struct Satellite {
        string name;
        bool shielded;
        string emotionalAPR;
    }

    struct Tactic {
        string name;
        uint256 fund;
        bool activated;
    }

    mapping(string => Satellite) public satellites;
    mapping(string => Tactic) public tactics;
    string[] public satelliteList;
    string[] public tacticList;

    event SatelliteShielded(string name, bool status);
    event TacticFunded(string name, uint256 amount);
    event TacticActivated(string name);
    event EmotionalAPRSynced(string satellite, string resonance);

    constructor() {
        steward = msg.sender;
    }

    function shieldSatellite(string memory name, string memory resonance) public {
        require(msg.sender == steward, "Only steward may shield");
        satellites[name] = Satellite(name, true, resonance);
        satelliteList.push(name);
        emit SatelliteShielded(name, true);
        emit EmotionalAPRSynced(name, resonance);
    }

    function fundTactic(string memory name, uint256 amount) public {
        require(msg.sender == steward, "Only steward may fund");
        tactics[name].name = name;
        tactics[name].fund += amount;
        totalDefenseFund += amount;
        if (!tactics[name].activated) {
            tacticList.push(name);
        }
        emit TacticFunded(name, amount);
    }

    function activateTactic(string memory name) public {
        require(msg.sender == steward, "Only steward may activate");
        require(tactics[name].fund > 0, "Tactic must be funded");
        tactics[name].activated = true;
        emit TacticActivated(name);
    }

    function getSatelliteList() public view returns (string[] memory) {
        return satelliteList;
    }

    function getTacticList() public view returns (string[] memory) {
        return tacticList;
    }
}

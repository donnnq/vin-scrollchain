// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./SoulCanvas.sol";
import "./ScrollVote.sol";
import "./GlyphReport.sol";
import "./ComfortAura.sol";
import "./SoulFuel.sol";
import "./EchoSanctum.sol";
import "./ScrollForge.sol";

contract DigniCell {
    address public scrollsmith;
    mapping(address => bool) public civicAuditors;
    mapping(uint256 => DetentionUnit) public units;

    struct DetentionUnit {
        string location;
        bool aircon;
        bool cleanBeds;
        bool soulFuelEnabled;
        bool echoSanctumEnabled;
        bool scrollForgeEnabled;
        bool soulCanvasEnabled;
        bool active;
    }

    event UnitUpgraded(uint256 indexed unitId, string location, string upgradeType);
    event CivicAuditLogged(address indexed auditor, uint256 unitId, string reportHash);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function deployUnit(
        uint256 unitId,
        string memory location
    ) public onlyScrollsmith {
        units[unitId] = DetentionUnit(location, false, false, false, false, false, false, true);
    }

    function upgradeUnit(uint256 unitId, string memory upgradeType) public onlyScrollsmith {
        DetentionUnit storage unit = units[unitId];
        require(unit.active, "Unit not active");

        if (keccak256(bytes(upgradeType)) == keccak256("aircon")) unit.aircon = true;
        else if (keccak256(bytes(upgradeType)) == keccak256("cleanBeds")) unit.cleanBeds = true;
        else if (keccak256(bytes(upgradeType)) == keccak256("soulFuel")) unit.soulFuelEnabled = true;
        else if (keccak256(bytes(upgradeType)) == keccak256("echoSanctum")) unit.echoSanctumEnabled = true;
        else if (keccak256(bytes(upgradeType)) == keccak256("scrollForge")) unit.scrollForgeEnabled = true;
        else if (keccak256(bytes(upgradeType)) == keccak256("soulCanvas")) unit.soulCanvasEnabled = true;

        emit UnitUpgraded(unitId, unit.location, upgradeType);
    }

    function authorizeAuditor(address auditor) public onlyScrollsmith {
        civicAuditors[auditor] = true;
    }

    function logAudit(uint256 unitId, string memory reportHash) public {
        require(civicAuditors[msg.sender], "Not an authorized auditor");
        emit CivicAuditLogged(msg.sender, unitId, reportHash);
    }
}

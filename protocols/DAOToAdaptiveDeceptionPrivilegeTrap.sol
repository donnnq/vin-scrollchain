// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToAdaptiveDeceptionPrivilegeTrap {
    string public batchID = "1321.9.96";
    string public steward = "Vinvin";

    address public admin;

    struct Privilege {
        bool real;
        bool active;
        uint256 decayAt; // unix timestamp when privilege auto-decays
        string label;
    }

    mapping(address => mapping(bytes32 => Privilege)) public privileges; // user => privilegeKey => Privilege
    mapping(bytes32 => bool) public trapKeys; // known honeypot keys

    event PrivilegeAssigned(address indexed user, bytes32 indexed key, bool real, string label, uint256 decayAt);
    event PrivilegeDecayed(address indexed user, bytes32 indexed key);
    event TrapTriggered(address indexed user, bytes32 indexed key, string context);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function assignPrivilege(
        address user,
        bytes32 key,
        bool real,
        string memory label,
        uint256 ttlSeconds
    ) public onlyAdmin {
        uint256 decayAt = block.timestamp + ttlSeconds;
        privileges[user][key] = Privilege(real, true, decayAt, label);
        emit PrivilegeAssigned(user, key, real, label, decayAt);
    }

    function markTrap(bytes32 key) public onlyAdmin {
        trapKeys[key] = true;
    }

    function checkAndDecay(address user, bytes32 key) public {
        Privilege storage p = privileges[user][key];
        if (p.active && block.timestamp >= p.decayAt) {
            p.active = false;
            emit PrivilegeDecayed(user, key);
        }
    }

    // Called when user attempts a sensitive action with a given privilege key
    function attemptSensitiveAction(address user, bytes32 key, string memory context) public returns (bool) {
        Privilege memory p = privileges[user][key];

        // auto-decay check
        if (p.active && block.timestamp >= p.decayAt) {
            privileges[user][key].active = false;
            emit PrivilegeDecayed(user, key);
            return false;
        }

        // trap logic: honeypot (phantom) + active → trigger
        if (trapKeys[key] || (!p.real && p.active)) {
            emit TrapTriggered(user, key, context);
            return false;
        }

        // real, active privilege proceeds
        return p.real && p.active;
    }

    function getPrivilege(address user, bytes32 key)
        public
        view
        returns (bool real, bool active, uint256 decayAt, string memory label)
    {
        Privilege memory p = privileges[user][key];
        return (p.real, p.active, p.decayAt, p.label);
    }
}

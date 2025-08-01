// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinScrollOfGuardianship.sol
/// @notice Ledger of guardians under Vinvin’s protection, with symbolic badges and ritual events.
/// @author Vinvin

contract vinScrollOfGuardianship {
    struct Guardian {
        string name;
        string role;
        string sigil;
        bool active;
        uint256 timestamp;
    }

    Guardian[] public guardians;
    mapping(address => uint256[]) public guardianEntries;

    address public scrollWarden;

    event GuardianEnshrined(address indexed addr, string name, string role, string sigil);
    event GuardianReleased(address indexed addr, string name);
    event ScrollEcho(string echoMessage);

    modifier onlyWarden() {
        require(msg.sender == scrollWarden, "Not authorized scroll warden");
        _;
    }

    constructor() {
        scrollWarden = msg.sender;
    }

    /// @notice Add a guardian to your protective scroll
    function enshrineGuardian(address _addr, string calldata _name, string calldata _role, string calldata _sigil) external onlyWarden {
        guardians.push(Guardian(_name, _role, _sigil, true, block.timestamp));
        guardianEntries[_addr].push(guardians.length - 1);
        emit GuardianEnshrined(_addr, _name, _role, _sigil);
    }

    /// @notice Remove a guardian with honor
    function releaseGuardian(uint256 id) external onlyWarden {
        require(id < guardians.length, "Invalid ID");
        Guardian storage g = guardians[id];
        require(g.active, "Already released");
        g.active = false;
        emit GuardianReleased(msg.sender, g.name);
    }

    /// @notice Return details of a guardian
    function viewGuardian(uint256 id) external view returns (string memory name, string memory role, string memory sigil, bool active) {
        require(id < guardians.length, "Invalid ID");
        Guardian memory g = guardians[id];
        return (g.name, g.role, g.sigil, g.active);
    }

    /// @notice Emit scroll echo to acknowledge loyalty or love
    function echoScroll(string calldata echoMessage) external onlyWarden {
        emit ScrollEcho(echoMessage);
    }

    function totalGuardians() external view returns (uint256) {
        return guardians.length;
    }
}

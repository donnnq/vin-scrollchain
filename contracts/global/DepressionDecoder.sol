// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title DepressionDecoder.sol
/// @notice Soulbound oracle for decoding economic collapse signals and activating civic recovery modules
/// @author Vinvin

contract DepressionDecoder {
    struct Signal {
        string source;       // e.g., "IMF", "Twitter", "Barangay Oracle"
        uint256 severity;    // Scale of 1–10
        string symbol;       // e.g., "breadline", "bankrun", "ghostcity"
        bool confirmed;
    }

    Signal[] public signals;
    address public scrollsmith;
    mapping(string => bool) public activatedModules;

    event SignalSubmitted(string source, uint256 severity, string symbol);
    event SignalConfirmed(uint256 index, string symbol, uint256 severity);
    event ModuleActivated(string moduleName);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a potential collapse signal
    function submitSignal(string memory source, uint256 severity, string memory symbol) public {
        signals.push(Signal(source, severity, symbol, false));
        emit SignalSubmitted(source, severity, symbol);
    }

    /// @notice Confirm a signal and trigger modules based on severity and symbol
    function confirmSignal(uint256 index) public onlyScrollsmith {
        require(index < signals.length, "Invalid index");
        Signal storage s = signals[index];
        s.confirmed = true;
        emit SignalConfirmed(index, s.symbol, s.severity);

        if (s.severity >= 7) {
            activateModule("CivicRecoveryFund");
        }

        bytes32 symbolHash = keccak256(bytes(s.symbol));

        if (symbolHash == keccak256("breadline")) {
            activateModule("EmotionalAudit.sol");
        } else if (symbolHash == keccak256("bankrun")) {
            activateModule("ScrollFirewall.sol");
        } else if (symbolHash == keccak256("ghostcity")) {
            activateModule("GeoReboot.sol");
        } else if (symbolHash == keccak256("memequake")) {
            activateModule("MythicMorale.sol");
        }
    }

    /// @notice Internal function to activate a civic module
    function activateModule(string memory moduleName) internal {
        activatedModules[moduleName] = true;
        emit ModuleActivated(moduleName);
        // Optional: trigger external ritual contracts here
    }

    /// @notice Check if a module is active
    function isModuleActive(string memory moduleName) public view returns (bool) {
        return activatedModules[moduleName];
    }

    /// @notice Get total number of submitted signals
    function getSignalCount() public view returns (uint256) {
        return signals.length;
    }

    /// @notice Get details of a specific signal
    function getSignal(uint256 index) public view returns (string memory, uint256, string memory, bool) {
        require(index < signals.length, "Invalid index");
        Signal memory s = signals[index];
        return (s.source, s.severity, s.symbol, s.confirmed);
    }
}

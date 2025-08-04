// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinCivicAuditBuddy {
    address public auditDirector;
    mapping(address => bool) public inspectors; // Not congress members
    mapping(address => bool) public exemptFromCongress; // Proven not affiliated

    struct Investigation {
        address target;
        bool initiated;
        bool violationConfirmed;
    }

    mapping(address => Investigation) public investigations;

    event InspectorAppointed(address indexed inspector);
    event InvestigationStarted(address indexed target);
    event ViolationDeclared(address indexed target);

    modifier onlyDirector() {
        require(msg.sender == auditDirector, "Not authorized");
        _;
    }

    modifier onlyInspector() {
        require(inspectors[msg.sender], "Inspector only");
        require(exemptFromCongress[msg.sender], "Must not be in Congress");
        _;
    }

    constructor() {
        auditDirector = msg.sender;
    }

    function appointInspector(address _inspector) external onlyDirector {
        inspectors[_inspector] = true;
        exemptFromCongress[_inspector] = true;
        emit InspectorAppointed(_inspector);
    }

    function startInvestigation(address _target) external onlyInspector {
        investigations[_target] = Investigation(_target, true, false);
        emit InvestigationStarted(_target);
    }

    function confirmViolation(address _target) external onlyInspector {
        require(investigations[_target].initiated, "No active investigation");
        investigations[_target].violationConfirmed = true;
        emit ViolationDeclared(_target);
        // Optional: Link to vinCivicSanctionEngine.sol for next steps
    }
}

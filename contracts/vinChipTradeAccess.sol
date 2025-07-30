// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinChipTradeAccess {
    address public scrollAuthority;
    string public scrollTitle = "Chip Trade Sanction Ledger";

    mapping(string => bool) public approvedChips;
    string[] public chipList;
    mapping(string => string) public chipNotes;

    event ChipApproved(string chipName, string context);
    event ChipRevoked(string chipName);
    event ScrollRenamed(string newTitle);

    modifier onlyAuthority() {
        require(msg.sender == scrollAuthority, "Access denied: not Scroll Authority");
        _;
    }

    constructor() {
        scrollAuthority = msg.sender;

        // Initial approvals
        _approveChip("H20", "Compliant AI chip for regulated markets");
        _approveChip("RTX5060", "Consumer-grade GPU with stable performance");
        _approveChip("GB300", "Blackwell flagship used in sovereign data nodes");
        _approveChip("NVL72", "AI infrastructure-grade for global supercomputing");
    }

    function _approveChip(string memory name, string memory note) internal {
        approvedChips[name] = true;
        chipList.push(name);
        chipNotes[name] = note;
        emit ChipApproved(name, note);
    }

    function approveChip(string memory name, string memory note) public onlyAuthority {
        require(!approvedChips[name], "Chip already approved");
        _approveChip(name, note);
    }

    function revokeChip(string memory name) public onlyAuthority {
        require(approvedChips[name], "Chip not approved");
        approvedChips[name] = false;
        emit ChipRevoked(name);
    }

    function renameScroll(string memory newTitle) public onlyAuthority {
        scrollTitle = newTitle;
        emit ScrollRenamed(newTitle);
    }

    function getChipDetails(string memory name) public view returns (bool approved, string memory note) {
        approved = approvedChips[name];
        note = chipNotes[name];
    }

    function listApprovedChips() public view returns (string[] memory) {
        return chipList;
    }
}

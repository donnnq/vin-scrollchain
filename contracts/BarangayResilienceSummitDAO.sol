// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayResilienceSummitDAO {
    address public admin;

    struct Summit {
        string barangay;
        string theme;
        uint256 date;
        bool completed;
    }

    Summit[] public summits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleSummit(string memory _barangay, string memory _theme, uint256 _date) external onlyAdmin {
        summits.push(Summit(_barangay, _theme, _date, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        summits[index].completed = true;
    }

    function getSummit(uint256 index) external view returns (Summit memory) {
        return summits[index];
    }
}

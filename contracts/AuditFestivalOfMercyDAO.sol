// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditFestivalOfMercyDAO {
    address public admin;

    struct Festival {
        string corridor;
        string auditTheme;
        string mercyProtocol;
        uint256 date;
        bool celebrated;
    }

    Festival[] public festivals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleFestival(string memory _corridor, string memory _auditTheme, string memory _mercyProtocol, uint256 _date) external onlyAdmin {
        festivals.push(Festival(_corridor, _auditTheme, _mercyProtocol, _date, false));
    }

    function markCelebrated(uint256 index) external onlyAdmin {
        festivals[index].celebrated = true;
    }

    function getFestival(uint256 index) external view returns (Festival memory) {
        return festivals[index];
    }
}

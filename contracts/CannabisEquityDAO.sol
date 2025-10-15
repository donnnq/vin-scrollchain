// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisEquityDAO {
    address public admin;

    struct EquityEntry {
        string companyName;
        string tickerSymbol;
        string accessStatus;
        string emotionalTag;
        bool listed;
    }

    EquityEntry[] public equities;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEquity(string memory _companyName, string memory _tickerSymbol, string memory _accessStatus, string memory _emotionalTag) external onlyAdmin {
        equities.push(EquityEntry(_companyName, _tickerSymbol, _accessStatus, _emotionalTag, false));
    }

    function markListed(uint256 index) external onlyAdmin {
        equities[index].listed = true;
    }

    function getEquity(uint256 index) external view returns (EquityEntry memory) {
        return equities[index];
    }
}

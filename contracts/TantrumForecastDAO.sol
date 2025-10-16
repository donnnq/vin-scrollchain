// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TantrumForecastDAO {
    address public admin;

    struct ForecastEntry {
        string entityLabel;
        string tantrumTrigger;
        string emotionalTag;
        bool predicted;
    }

    ForecastEntry[] public forecasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _tantrumTrigger, string memory _emotionalTag) external onlyAdmin {
        forecasts.push(ForecastEntry(_entityLabel, _tantrumTrigger, _emotionalTag, false));
    }

    function markPredicted(uint256 index) external onlyAdmin {
        forecasts[index].predicted = true;
    }

    function getEntry(uint256 index) external view returns (ForecastEntry memory) {
        return forecasts[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface SigilAllianceOracle {
    function getGeoSentiment(string calldata region) external view returns (int256);
    function isHighAlert(string calldata region) external view returns (bool);
}

contract vinSigilResponseProtocol {
    address public owner;
    mapping(string => bool) public allyReadySignal;

    event HighAlertActivated(string region, string actionTaken);
    event BravadoThresholdExceeded(string speaker, uint256 intensityLevel);

    SigilAllianceOracle public oracle;

    constructor(address oracleAddress) {
        owner = msg.sender;
        oracle = SigilAllianceOracle(oracleAddress);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function calibrateAlly(string memory allyRegion, bool readiness) public onlyOwner {
        allyReadySignal[allyRegion] = readiness;
    }

    function detectBravado(string calldata speaker, uint256 intensityLevel) public {
        if (intensityLevel >= 88) {
            emit BravadoThresholdExceeded(speaker, intensityLevel);
        }
    }

    function activateProtocol(string memory targetRegion) public {
        require(oracle.isHighAlert(targetRegion), "No high alert in region");

        for (string memory ally in getAllAllies()) {
            if (allyReadySignal[ally]) {
                // Symbolic reaction — can be replaced with NFT mint, broadcast sigil, or civic ritual trigger
                emit HighAlertActivated(targetRegion, string(abi.encodePacked("Sigil surge activated for ally: ", ally)));
            }
        }
    }

    function getAllAllies() internal pure returns (string[] memory) {
        string[] memory allies = new string[](3);
        allies[0] = "PHL";
        allies[1] = "JPN";
        allies[2] = "ROK";
        return allies;
    }
}

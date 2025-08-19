// nano path: /scrollchain/sanctum/ExportSanctum.sol

pragma solidity ^0.8.20;

contract ExportSanctum {
    address public steward;
    mapping(string => uint256) public tributeRate; // e.g., "H20" => 15%

    event LicenseGranted(string chipModel, address recipient, uint256 tributeRate);
    event ExportLogged(string chipModel, uint256 revenue, uint256 tributePaid);

    constructor() {
        steward = msg.sender;
    }

    function setTributeRate(string memory chipModel, uint256 rate) public {
        require(msg.sender == steward, "Only steward can set tribute");
        tributeRate[chipModel] = rate;
    }

    function grantLicense(string memory chipModel, address recipient) public {
        require(msg.sender == steward, "Only steward can grant license");
        emit LicenseGranted(chipModel, recipient, tributeRate[chipModel]);
    }

    function logExport(string memory chipModel, uint256 revenue) public {
        uint256 tribute = (revenue * tributeRate[chipModel]) / 100;
        emit ExportLogged(chipModel, revenue, tribute);
    }
}

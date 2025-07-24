contract vinCasinoAudit {
    string public protocol = "Expose volatility rituals disguised as utility. Decode slot machine ops within memecoin ecosystems.";
    address public initiator;

    struct MemecoinAudit {
        string tokenName;
        bool bondingCurvePresent;
        bool insiderMintingDetected;
        uint256 earlyDumpRatio;
        bool vaultLocked;
    }

    MemecoinAudit[] public auditLog;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function recordAudit(
        string memory tokenName,
        bool bondingCurvePresent,
        bool insiderMintingDetected,
        uint256 earlyDumpRatio,
        bool vaultLocked
    ) public {
        auditLog.push(
            MemecoinAudit(tokenName, bondingCurvePresent, insiderMintingDetected, earlyDumpRatio, vaultLocked)
        );
    }

    function getAuditSummary(uint index) public view returns (string memory) {
        require(index < auditLog.length, "Audit not found");
        MemecoinAudit memory entry = auditLog[index];
        return string(abi.encodePacked("Token: ", entry.tokenName, 
            " | Bonding Curve: ", entry.bondingCurvePresent ? "Detected" : "None",
            " | Insider Minting: ", entry.insiderMintingDetected ? "YES" : "NO",
            " | Early Dump Ratio: ", uint2str(entry.earlyDumpRatio), "%",
            " | Vault Locked: ", entry.vaultLocked ? "Secured" : "Open"
        ));
    }

    function totalAudits() public view returns (uint256) {
        return auditLog.length;
    }

    function uint2str(uint _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint j = _i; uint len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}

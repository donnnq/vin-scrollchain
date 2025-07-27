/// @title vinBarangayPermitHub
/// @notice Decentralized registry of herbal permit issuers and barangay-aligned licenses.
contract vinBarangayPermitHub {
    struct PermitIssuer {
        string barangay;
        string officialName;
        bool acceptsFranchiseApps;
        uint256 franchiseFee;
        string contactInfo;
    }

    mapping(string => PermitIssuer) public issuers;
    string[] public activeBarangays;
    event FranchiseEnabled(string barangay, string contactInfo);

    function registerBarangay(
        string calldata barangay,
        string calldata officialName,
        bool acceptsFranchiseApps,
        uint256 franchiseFee,
        string calldata contactInfo
    ) external {
        issuers[barangay] = PermitIssuer({
            barangay: barangay,
            officialName: officialName,
            acceptsFranchiseApps: acceptsFranchiseApps,
            franchiseFee: franchiseFee,
            contactInfo: contactInfo
        });
        activeBarangays.push(barangay);
        emit FranchiseEnabled(barangay, contactInfo);
    }

    function getBarangayList() external view returns (string[] memory) {
        return activeBarangays;
    }
}

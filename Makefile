-include .env

build:; forge build

deploy-sepolia:;
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc_url $(SEPOLIA_RPC_URL) --private_key $(SEPOLIA_PRIVATE_KEY) --broadcast --verify --etherscan_api_key $(SEPOLIA_ETHERSCAN_API_KEY) -vvv
	